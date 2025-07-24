/* eslint-disable */
import { FuseNavigationItem } from '@fuse/components/navigation';

export const defaultNavigation = (role: any): FuseNavigationItem[] => {
    const navigation: FuseNavigationItem[] = [];

    if (role === 1) {
        // Super Admin - Full Access
        navigation.push(
            {
                id: 'dashboard',
                title: 'Dashboard',
                type: 'basic',
                icon: 'mat_solid:dashboard',
                link: '/dashboard',
            },
            {
                id: 'schoolManagement',
                title: 'School Management',
                type: 'collapsable',
                icon: 'heroicons_outline:academic-cap', 
                children: [
                    {
                        id: 'addschool',
                        title: 'Add School',
                        type: 'basic',
                        icon: 'heroicons_outline:building-library',
                        link: '/addschool',
                    },
                    {
                        id: 'addboard',
                        title: 'Add Board',
                        type: 'basic',
                        icon: 'heroicons_outline:clipboard-document-check', 
                        link: '/addboard',
                    },
                    {
                        id: 'addclass',
                        title: 'Add Class',
                        type: 'basic',
                        icon: 'heroicons_outline:rectangle-stack',
                        link: '/addclass',
                    },
                    {
                        id: 'addsubject',
                        title: 'Add Subject',
                        type: 'basic',
                        icon: 'heroicons_outline:book-open', 
                        link: '/addsubject',
                    },
                    {
                        id: 'addchapter',
                        title: 'Add Chapters',
                        type: 'basic',
                        icon: 'heroicons_outline:document-text', 
                        link: '/addchapter',
                    },
                ],
            }
        );
    } else if (role === 2) {
        // Admin - Limited Access
        navigation.push(
            {
                id: 'dashboard',
                title: 'Dashboard',
                type: 'basic',
                icon: 'mat_solid:dashboard',
                link: '/dashboard',
            },
            {
                id: 'class',
                title: 'Class',
                type: 'basic',
                icon: 'heroicons_outline:rectangle-stack', 
                link: '/showclass',
            },
            {
                id: 'addStudent',
                title: 'Add Student',
                type: 'basic',
                icon: 'heroicons_outline:user-plus', 
                link: '/addStudent',
            }
        );
    } else if (role === 3) {
        // Teacher/Faculty
        navigation.push(
            {
                id: 'dashboard',
                title: 'Dashboard',
                type: 'basic',
                icon: 'mat_solid:dashboard',
                link: '/dashboard',
            },
            {
                id: 'reports',
                title: 'Reports',
                type: 'basic',
                icon: 'heroicons_outline:chart-bar', 
                link: '/addAdmin',
            }
        );
    } else if (role === 4) {
        // Student/User
        navigation.push(
            {
                id: 'dashboard',
                title: 'Dashboard',
                type: 'basic',
                icon: 'mat_solid:dashboard',
                link: '/dashboard',
            }
        );
    }

    return navigation;
};
